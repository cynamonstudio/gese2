<template id="consents-modal">
    <div class="consents">
        <div class="consents__wrapper">
            <div class="consents__modal">
                <div class="consents__basic-view js__basic-view" role="dialog" aria-modal="true" aria-labelledby="customer_privacy_banner_header">
                    <div class="consents__content">
                        <p class="consents__heading" id="customer_privacy_banner_header">
                            {$customer_privacy.banner_header|escape}
                        </p>

                        {$customer_privacy.banner_content}

                        {if $customer_privacy.display_link_to_privacy_policy|escape}
                            <p>
                                <a class="consents__link" href="{$customer_privacy.privacy_policy_link|escape}">{$customer_privacy.privacy_policy_link_content|escape}</a>
                            </p>
                        {/if}
                    </div>

                    <div class="consents__buttons">
                        {feature name="customer_privacy_v2"}
                            <button type="button" class="btn js__accept-necessary">{translate key="Allow only necessary"}</button>
                        {/feature}
                        <button type="button" class="btn js__show-advanced-view">{translate key="Customize consents"}</button>
                        <button type="button" class="btn btn-red js__accept-all-consents">{translate key="Allow all"}</button>
                    </div>
                </div>

                <div class="consents__advanced-view js__advanced-view none" role="dialog" aria-modal="true" aria-labelledby="customer_privacy_cookie_header">
                    <div class="consents__advanced-content">
                        <p class="consents__heading" id="customer_privacy_cookie_header">
                            {$customer_privacy.cookie_header|escape}
                        </p>

                        {$customer_privacy.cookie_content}
                        <br>

                        <div class="consents__consent">
                            <div class="consents__consent-checkbox">
                                <span class="checkbox-wrap">
                                    <input type="checkbox" id="select_all" class="checkbox js__select-all-consents">
                                    <label for="select_all"></label>
                                </span>
                            </div>

                            <div class="consents__consent-description">
                                <p class="consents__text">
                                    <label for="select_all"><strong>{translate key="Select all"}</strong></label>
                                </p>
                            </div>
                        </div>

                        <div class="consents__consent">
                            <div class="consents__consent-checkbox">
                                <span class="checkbox-wrap">
                                    <input type="checkbox" id="functionCategoryConsent" name="functionCategoryConsent" class="checkbox" checked disabled>
                                    <label for="functionCategoryConsent"></label>
                                </span>
                            </div>

                            <div class="consents__consent-description">
                                <p class="consents__text">
                                    <label for="functionCategoryConsent"><strong>{translate key="Necessary for the website to function"}</strong></label>
                                </p>

                                <p>
                                    {$customer_privacy.function_category_description}
                                </p>
                            </div>
                        </div>

                        <div class="consents__consent">
                            <div class="consents__consent-checkbox">
                                <span class="checkbox-wrap">
                                    <input type="checkbox" id="functionalConsent" name="functionalConsent" class="checkbox js__consent">
                                    <label for="functionalConsent"></label>
                                </span>
                            </div>

                            <div class="consents__consent-description">
                                <p class="consents__text">
                                    <label for="functionalConsent"><strong>{translate key="Functional"}</strong></label>
                                </p>

                                <p>
                                    {$customer_privacy.functional_cookie_description}
                                </p>
                            </div>
                        </div>

                        <div class="consents__consent">
                            <div class="consents__consent-checkbox">
                                <span class="checkbox-wrap">
                                    <input type="checkbox" id="analyticsConsent" name="analyticsConsent" class="checkbox js__consent">
                                    <label for="analyticsConsent"></label>
                                </span>
                            </div>

                            <div class="consents__consent-description">
                                <p class="consents__text">
                                    <label for="analyticsConsent"><strong>{translate key="Analytical"}</strong></label>
                                </p>

                                <p>
                                    {$customer_privacy.analytical_cookie_description}
                                </p>
                            </div>
                        </div>

                        <div class="consents__consent">
                            <div class="consents__consent-checkbox">
                                <span class="checkbox-wrap">
                                    <input type="checkbox" id="platformAnalyticsConsent" name="platformAnalyticsConsent" class="checkbox js__consent">
                                    <label for="platformAnalyticsConsent"></label>
                                </span>
                            </div>

                            <div class="consents__consent-description">
                                <p class="consents__text">
                                    <label for="platformAnalyticsConsent"><strong>{translate key="Analytical software provider"}</strong></label>
                                </p>

                                <p>
                                    {$customer_privacy.platform_cookie_description}
                                </p>
                            </div>
                        </div>

                        <div class="consents__consent">
                            <div class="consents__consent-checkbox">
                                <span class="checkbox-wrap">
                                    <input type="checkbox" id="marketingConsent" name="marketingConsent" class="checkbox js__consent">
                                    <label for="marketingConsent"></label>
                                </span>
                            </div>

                            <div class="consents__consent-description">
                                <p class="consents__text">
                                    <label for="marketingConsent"><strong>{translate key='Marketing <<cookies>>'}</strong></label>
                                </p>

                                <p>
                                    {$customer_privacy.marketing_cookie_description}
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="consents__advanced-buttons">
                        <button type="button" class="btn js__show-basic-view">{translate key="Cancel"}</button>
                        <button type="button" class="btn btn-red js__save-consents">{translate key="Save preferences"}</button>
                    </div>
                </diV>
            </div>
        </div>

        <div class="consents__mask"></div>
    </div>
</template>