class Datagrid::Rows::Row
  attr_accessor :asset, :grid, :view_context

  def initialize(asset, grid, view_context=nil)
    @asset = asset
    @grid = grid
    @view_context = view_context
  end

  def [](column_name)
    if view_context
      html_value(column_name)
    else
      data_value(column_name)
    end
  end

  def data_value(column_name)
    find_or_create_column(column_name).data_value(asset, grid)
  end

  def html_value(column_name)
    find_or_create_column(column_name).html_value(@view_context, asset, grid)
  end

  def find_or_create_column(column_name)
    column = grid.column_by_name(column_name)
    return column if column

    # create it if it doesn't exist
    grid.class.column column_name
    grid.column_by_name(column_name)
  end
end
