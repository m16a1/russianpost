# coding: utf-8
require 'factory_girl'

FactoryGirl.define do
  
  factory :good_response, class: Object do
    initialize_with do
      {
        operation_history_data: { 
          history_record: [{
            address_parameters: {
              operation_address: {description: "Германия DEFRAA"},
              mail_direct: {id: "643", name_ru: "Российская Федерация"},
              country_oper: {id: "276"}
            },
            finance_parameters: nil,
            item_parameters: {
              barcode: "EE004107342DE",
              valid_ru_type: false,
              valid_en_type: false
            },
            operation_parameters: {
              oper_type: {
                id: "0",
                name: "Экспорт"
              },
              oper_attr: {id: "0"},
              oper_date:  DateTime.parse('2012-09-08T09:50:00+04:00')
            },
            user_parameters: nil
          }]
        }
      }
    end
  end
end