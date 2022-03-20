FactoryBot.define do
  factory :event do
    sequence(:id)
    association :user

    title { Faker::Lorem.word }
    address { Faker::Address.full_address }
    datetime { Faker::Date.forward }
    description { Faker::Lorem.paragraph }
    last_modified { Faker::Date.backward }

    file_img = Dir.glob('spec/fixtures/files/img/**/*').reject {|f| File.directory?(f)}.sample
    image { Rack::Test::UploadedFile.new(file_img, Rack::Mime.mime_type(File.extname(file_img))) }

    file_ss = Dir.glob('spec/fixtures/files/spreadsheet/*').reject {|f| File.directory?(f)}.sample
    box_office { Rack::Test::UploadedFile.new(file_ss, Rack::Mime.mime_type(File.extname(file_ss))) }

    factory :event_all do
      transient do
        guests_count {3}
        referral_count {3}
      end

      after(:create) do |event, evaluator|
        create_list :guest, evaluator.guests_count, event: event
        event.reload
      end
    end
  end
end