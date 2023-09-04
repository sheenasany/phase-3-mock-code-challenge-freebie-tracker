class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        new_freebie = Freebie.new(item_name: item_name, value: value, company_id: self.id, dev_id: dev.id)
        new_freebie.save
    end

    def self.oldest_company
        self.order(:founding_year).first
    end
end
