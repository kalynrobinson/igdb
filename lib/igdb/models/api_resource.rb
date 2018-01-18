require 'representable/json'
require 'ostruct'

module Igdb
  class ApiResource < OpenStruct
    class << self
      attr_accessor :path, :representer

      def count
        Igdb::Requester.get("#{path}/count")['count']
      end

      def meta
        Igdb::Requester.get("#{path}/meta")
      end

      def find(id, **kwargs)
        kwargs[:fields] = kwargs[:fields] || '*'

        if id.class == Array
          build_collection(Igdb::Requester.get("#{path}/#{id.join(',')}", kwargs), representer)
        else
          build_single_resource(Igdb::Requester.get("#{path}/#{id}", kwargs)[0], representer)
        end
      end

      def slug(id, **kwargs)
        kwargs[:fields] = kwargs[:fields] || '*'
        kwargs[:'filter[slug][eq]'] = id

        build_single_resource(Igdb::Requester.get("#{path}/", kwargs)[0], representer)
      end

      def search(**kwargs)
        kwargs[:offset] = kwargs[:offset] || 0
        kwargs[:limit] = kwargs[:limit] || 50
        kwargs[:fields] = kwargs[:fields] || '*'

        build_collection(Igdb::Requester.get("#{path}/", kwargs), representer)
      end

      # Alias for #search
      def all(**kwargs)
        search(kwargs)
      end

      private

      def build_single_resource(response, representer)
        representer.new(new).from_hash(response)
      end

      def build_collection(response, representer)
        representer.for_collection.new([]).from_hash(response)
      end
    end
  end
end
