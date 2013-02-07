require 'savon'
require 'russianpost/version'

class RussianPost
  SOAP_URL = 'http://voh.russianpost.ru:8080/niips-operationhistory-web/OperationHistory'
  DEFAULT_OPTIONS = {log: false, log_level: :error, proxy: nil}

  autoload :IncorrectTrackingNumber, 'russianpost/incorrect_tracking_number'

  def initialize(tracking_number, options = {})
    @tracking_number = tracking_number
    @options = DEFAULT_OPTIONS.merge options
    check!
  end

  def get_history
    api_request[:operation_history_data][:history_record]
  end

  private

  def check!
    unless @tracking_number =~ /^\d{14}|[[:upper:]]{2}\d{9}[[:upper:]]{2}$/
      raise IncorrectTrackingNumber.new(@tracking_number)
    end
  end
  
  def api_request
    options = @options
    client = Savon.client do
      endpoint SOAP_URL
      namespace 'http://russianpost.org/operationhistory/data'
      log options[:log]
      log_level options[:log_level]
      proxy(options[:proxy]) if options[:proxy]
      convert_request_keys_to :camelcase
    end
    client.call(:operation_history_request, xml: build_xml).to_hash
  end

  def build_xml
    <<-XML
    <s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/">
       <s:Header/>
       <s:Body xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
           <OperationHistoryRequest xmlns="http://russianpost.org/operationhistory/data">
               <Barcode>#{@tracking_number}</Barcode>
               <MessageType>0</MessageType>
           </OperationHistoryRequest>
       </s:Body>
    </s:Envelope>
    XML
  end
end