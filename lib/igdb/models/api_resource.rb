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

      def find(id, **params)
        params[:fields] ||= '*'
        return find_by_slug(id, params) if id.class == String

        build_single_resource(Igdb::Requester.get("#{path}/#{id}", params)[0], representer)
      end

      def select(*ids, **params)
        params[:fields] ||= '*'

        build_collection(Igdb::Requester.get("#{path}/#{ids.join ','}", params), representer)
      end

      def all(**params)
        params[:fields] ||= '*'
        params[:limit] ||= 50

        build_collection(Igdb::Requester.get("#{path}/", params), representer)
      end

      private

      def find_by_slug(slug, params)
        params[:'filter[slug][eq]'] = slug

        build_single_resource(Igdb::Requester.get("#{path}/", params)[0], representer)
      end

      def build_single_resource(response, representer)
        representer.new(new).from_hash(response)
      end

      def build_collection(response, representer)
        representer.for_collection.new([]).from_hash(response)
      end
    end
  end
end
