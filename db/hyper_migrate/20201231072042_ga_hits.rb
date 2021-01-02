class GaHits < ActiveRecord::Migration[6.1]
  def change
    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters

    ###  General  ####
    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#v
    add_column :hits, :protocol_version, :string, default: '1'
    
    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#tid
    add_column :hits, :tracking_id, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#aip
    # TODO
    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#npa

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#ds
    add_column :hits, :data_source, :string, default: 'web' # options -> [web, app, crm, call center]

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#qt
    add_column :hits, :queue_time, :integer, default: 0


    ### User ###
    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#cid
    add_column :hits, :client_id, :string, null: false

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#uid
    add_column :hits, :user_id, :string

    ### Session ###
    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#sc
    add_column :hits, :session_control, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#uip
    add_column :hits, :ip_override, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#ua
    add_column :hits, :user_agent_override, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#geoid
    add_column :hits, :geographical_override, :string


    ### Traffic Sources ###
    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#dr
    add_column :hits, :referrer, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#cn
    add_column :hits, :campaign_name, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#cs
    add_column :hits, :campaign_source, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#cm
    add_column :hits, :campaign_medium, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#ck
    add_column :hits, :campaign_keyword, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#cc
    add_column :hits, :campaign_content, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#ci
    add_column :hits, :campaign_id

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#gclid
    add_column :hits, :google_ads_id, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#dclid
    add_column :hits, :google_display_ads_id, :string

    ### System Info ###
    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#sr
    add_column :hits, :screen_resolution, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#vp
    add_column :hits, :viewport_size, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#sd
    add_column :hits, :screen_colors, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#ul
    add_column :hits, :user_language, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#je
    add_column :hits, :java_enabled, :boolean, default: true

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#fl
    add_column :hits, :flash_version, :string

    ### Hit ###
    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#t
    # Must be one of 'pageview', 'screenview', 'event', 'transaction', 'item', 'social', 'exception', 'timing'.
    add_column :hits, :hit_type, :string, default: 'pageview'

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#ni
    add_column :hits, :non_interaction_hit, :boolean, default: false


    ##3 Content Information ###
    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#dl
    add_column :hits, :location_url, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#dh
    add_column :hits, :hostname, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#dp
    add_column :hits, :path, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#dt
    add_column :hits, :title, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#cd
    # Required for screenview hit type.
    # This parameter is optional on web properties, and required on mobile properties for screenview hits, where it is used for the 'Screen Name' of the screenview hit. On web properties this will default to the unique URL of the page by either using the &dl parameter as-is or assembling it from &dh and &dp.
    add_column :hits, :screen_name, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#cg_
    add_column :hits, :content_group, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#linkid
    add_column :hits, :link_id, :string

    ### App ###
    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#an
    add_column :hits, :application_name, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#aid
    add_column :hits, :application_id, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#av
    add_column :hits, :application_version, :string

    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#aiid
    add_column :hits, :application_installer_id, :string


    ### Events ###
    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#ec
    add_column :hits, :event_category, :string
    add_column :hits, :event_action, :string
    add_column :hits, :event_label, :string
    add_column :hits, :event_value, :string

    ### Social Interactions ###
    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#social
    add_column :hits, :social_network, :string
    add_column :hits, :social_action, :string
    add_column :hits, :social_action_target, :string


    ### User Timings ###
    # https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#timing
    add_column :hits, :user_timing_category, :string
    add_column :hits, :user_timing_variable_name, :string
    add_column :hits, :user_timing_time, :integer
    add_column :hits, :user_timing_label, :string
    add_column :hits, :page_load_time, :integer
    add_column :hits, :dns_time, :integer
    add_column :hits, :page_download_time, :integer
    add_column :hits, :redirect_response_time, :integer
    add_column :hits, :tcp_connect_time, :integer
    add_column :hits, :server_response_time, :integer
    add_column :hits, :dom_interactive_time, :integer
    add_column :hits, :content_load_time, :integer

    ### Exceptions ###
    add_column :hits, :exception_description, :string
    add_column :hits, :is_exception_fatal, :boolean, default: true

    ### Custom Dimensions & Metrics ###
    add_column :hits, :custom_dimension, :jsonb, default: {}
    add_column :hits, :custom_metric, :jsonb, default: {}




  end
end
