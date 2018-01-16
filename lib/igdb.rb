module Igdb
  # Utilities
  autoload :Configuration, 'igdb/configuration/api'
  autoload :Requester, 'igdb/requester'
  autoload :Exception, 'igdb/exceptions'
  autoload :VERSION, 'igdb/version'

  # Models
  autoload :ApiResource, 'igdb/models/api_resource'
  autoload :AlternativeName, 'igdb/models/alternative_name'
  autoload :Character, 'igdb/models/character'
  autoload :Collection, 'igdb/models/collection'
  autoload :Company, 'igdb/models/company'
  autoload :Credits, 'igdb/models/credits'
  autoload :Feed, 'igdb/models/feed'
  autoload :Franchise, 'igdb/models/franchise'
  autoload :Game, 'igdb/models/game'
  autoload :GameEngine, 'igdb/models/game_engine'
  autoload :GameMode, 'igdb/models/game_mode'
  autoload :Genre, 'igdb/models/genre'
  autoload :Image, 'igdb/models/image'
  autoload :Keyword, 'igdb/models/keyword'
  autoload :Page, 'igdb/models/page'
  autoload :Person, 'igdb/models/person'
  autoload :Platform, 'igdb/models/platform'
  autoload :PlayerPerspective, 'igdb/models/player_perspective'
  autoload :Pulse, 'igdb/models/pulse'
  autoload :PulseGroup, 'igdb/models/pulse_group'
  autoload :PulseSource, 'igdb/models/pulse_source'
  autoload :ReleaseDate, 'igdb/models/release_date'
  autoload :Review, 'igdb/models/review'
  autoload :Theme, 'igdb/models/theme'
  autoload :Title, 'igdb/models/title'
  autoload :Version, 'igdb/models/version'
  autoload :Video, 'igdb/models/video'

  # Presenters
  autoload :Representer, 'igdb/representers/representer'
  autoload :AlternativeNameRepresenter, 'igdb/representers/alternative_name_representer'
  autoload :CharacterRepresenter, 'igdb/representers/character_representer'
  autoload :CollectionRepresenter, 'igdb/representers/collection_representer'
  autoload :CompanyRepresenter, 'igdb/representers/company_representer'
  autoload :CreditsRepresenter, 'igdb/representers/credits_representer'
  autoload :FeedRepresenter, 'igdb/representers/feed_representer'
  autoload :FranchiseRepresenter, 'igdb/representers/franchise_representer'
  autoload :GameEngineRepresenter, 'igdb/representers/game_engine_representer'
  autoload :GameModeRepresenter, 'igdb/representers/game_mode_representer'
  autoload :GameRepresenter, 'igdb/representers/game_representer'
  autoload :GenreRepresenter, 'igdb/representers/genre_representer'
  autoload :ImageRepresenter, 'igdb/representers/image_representer'
  autoload :KeywordRepresenter, 'igdb/representers/keyword_representer'
  autoload :PageRepresenter, 'igdb/representers/page_representer'
  autoload :PersonRepresenter, 'igdb/representers/person_representer'
  autoload :PlatformRepresenter, 'igdb/representers/platform_representer'
  autoload :PlayerPerspectiveRepresenter, 'igdb/representers/player_perspective_representer'
  autoload :PulseGroupRepresenter, 'igdb/representers/pulse_group_representer'
  autoload :PulseRepresenter, 'igdb/representers/pulse_representer'
  autoload :PulseSourceRepresenter, 'igdb/representers/pulse_source_representer'
  autoload :ReleaseDateRepresenter, 'igdb/representers/release_date_representer'
  autoload :ReviewRepresenter, 'igdb/representers/review_representer'
  autoload :ThemeRepresenter, 'igdb/representers/theme_representer'
  autoload :TitleRepresenter, 'igdb/representers/title_representer'
  autoload :VersionRepresenter, 'igdb/representers/version_representer'
  autoload :VideoRepresenter, 'igdb/representers/video_representer'

  def self.connect(api_key = ENV['IGDB_KEY'])
    Igdb::Configuration::Api.instance.tap do |api|
      api.connect(api_key)
    end
  end
end
