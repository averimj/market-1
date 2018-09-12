class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.map do |vendor|
      if vendor.inventory.include? item
        vendor
      end
    end.compact
  end

  def sorted_item_list
    keys = @vendors.map do |vendor|
              vendor.inventory.keys
            end
            duplicates = keys.sort_by do |key|
                            key
                          end.flatten
            duplicates.uniq
  end

  def total_inventory
    items = @vendors.map do |vendor|
              vendor.inventory
            end
            items.inject({}) { |aggregate, hash| aggregate.merge hash }
            require "pry"; binding.pry
  end

end
