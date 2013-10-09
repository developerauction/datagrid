module Datagrid

  module Rows
    require "datagrid/rows/row"

    # InstanceMethods

    # wrap an individual item
    def wrap(asset)
      Row.new(asset, self)
    end

    def wrapped_assets
      assets.map do |asset|
        wrap(asset)
      end
    end
  end
end
