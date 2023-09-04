class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
    #    dev.freebies.any?
        # self.freebies.any?
        # any? returns an array so must iterate over it to pull one
        freebies.any? do |freebie|
            freebie.item_name == item_name
        end
    end

    def give_away(dev, freebie)
        # updates the freebie in database to the 
        freebie.update(dev: dev) unless freebie.dev != self

        # if freebie.dev_id == self.id
            #   freebie.dev_id = dev.id 
            #   freebie.save
        
            # self.freebies.each do |instance|
            #     if instance == freebie
            #         dev.freebies << freebie
    end
end
