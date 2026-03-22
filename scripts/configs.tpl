{literal}
    <script id="config-analytics" type="application/json">
        {
            "clientGoogleAnalyticsV4": {
                "isActive": "{/literal}{$googlev4Settings.active|escape}{literal}",
                "trackingId": "{/literal}{$googlev4Settings.analytics_id|escape}{literal}",
                "isGtm": "{/literal}{$googlev4Settings.send_with_gtm|escape}{literal}"
                {/literal}
                    {feature name="config_google_remarketing"}
                        {literal},
                                "googleRemarketing": {
                                    "isRemarketingActive": {/literal}{if $googleRemarketing.remarketing_active|escape}true{else}false{/if}{literal},
                                    "conversionId": "{/literal}{$googleRemarketing.conversion_id|escape}{literal}",
                                    "conversionLabel": "{/literal}{$googleRemarketing.conversion_label|escape}{literal}",
                                    "isConversionEnabled": {/literal}{if $googleRemarketing.conversion_enabled|escape}true{else}false{/if}{literal},
                                    "isShoppingAdsEnabled": {/literal}{if $googleRemarketing.shopping_ads_enabled|escape}true{else}false{/if}{literal},
                                    "awMerchantId": "{/literal}{$googleRemarketing.aw_merchant_id|escape}{literal}",
                                    "awFeedCountry": "{/literal}{$googleRemarketing.aw_feed_country|escape}{literal}",
                                    "awFeedLanguage": "{/literal}{$googleRemarketing.aw_feed_language|escape}{literal}"
                                }
                        {/literal}
                    {/feature}
                {literal}
            },

            "facebookBusinessExtension": {
                "isActive": {/literal}{if $isFbeEnabled}true{else}false{/if}{literal},
                "pixelId": "{/literal}{$fbePixelId|escape}{literal}"
            }
            {/literal}
                {feature name="google_analytics_v4_campaign"}
                    {literal},
                        "campaignGoogleAnalyticsV4": {
                            "isActive": {/literal}{if $shoperCampaignsGa4Settings.isActive}true{else}false{/if}{literal},
                            "trackingId": "{/literal}{$shoperCampaignsGa4Settings.measurementId|escape}{literal}",
                            "isGtm": "0"
                        }
                    {/literal}
                {/feature}
            {literal}
        }
    </script>
{/literal}