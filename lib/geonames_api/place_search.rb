module GeoNamesAPI
  class PlaceSearch < ListEndpoint

    METHOD = 'searchJSON'
    FIND_PARAMS = %w(q country countryBias maxRows fuzzy orderby)
    DEFAULT_MAX_ROWS = 100
    DEFAULT_FUZZY = 1
    DEFAULT_ORDER_BY = 'relevance'

    def self.find_by_place_name(name, opts={})
      opts[:name] = name
      opts[:maxRows] ||= DEFAULT_MAX_ROWS
      opts[:fuzzy] ||= DEFAULT_FUZZY
      opts[:orderby] ||= DEFAULT_ORDER_BY
      where opts
    end

    def self.find_by_exact_place_name(name, opts={})
      opts[:name_equals] = name
      where opts
    end
  end
end
