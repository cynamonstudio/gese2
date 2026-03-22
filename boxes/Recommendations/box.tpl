{if count($boxNs->$box_id->list)}
    <div class="box slider loading" id="box_recommendations_{$box_id|escape}">
        <div class="boxhead">
            <span><img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">{$boxNs->$box_id->title|escape}</span>
        </div>
        <div class="innerbox">
            {if $boxNs->$box_id->text}<h5 class="boxintro">{$boxNs->$box_id->text}</h5>{/if}
                {foreach from=$boxNs->$box_id->list item=rec name=list}
                    <div data-product-id="{$rec->object->product->product_id}" data-category="{$rec->object->defaultCategory->translation->name|escape}" {if $rec->object->product->producer_id}data-producer="{$rec->object->producer->manufacturer->name|escape}"{/if} class="product row center{if $rec->object->readVisibilityConfigListItemGrayFlag()} product_inactive{/if}">
                        <a
                            href="{recommendationsViewRoute value=$rec}"
                            title="{$rec->object->translation->name|escape}"
                            class="row"
                            rel="nofollow"
                            aria-label="{translate key='Go to the product'} {$rec->object->translation->name|escape}"
                        >
                            <span class="boximgsize row lazy-load">
                                <img src="data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs%3D" data-src="{imageUrl type='productGfx' width=$skin_settings->img->medium height=$skin_settings->img->medium image=$rec->object->getPromotingGfxName() overlay=1}" alt="{$rec->object->translation->name|escape}">

                                <noscript>
                                    <img src="{imageUrl type='productGfx' width=$skin_settings->img->medium height=$skin_settings->img->medium image=$rec->object->getPromotingGfxName() overlay=1}" alt="{$rec->object->translation->name|escape}">
                                </noscript>
                            </span>
                            <div class="productnamewrap row">
                                <span class="productname">{$rec->object->translation->name|escape}</span>
                            </div>
                        </a>

                        <div class="price row">
                        {if $showprices}
                            {if $price_mode == '1' || $price_mode == '3'}
                                {if $rec->object->specialOffer}
                                    <p>
                                        <em class="color">{currency value=$rec->object->defaultStock->getSpecialOfferPrice()}</em>
                                    </p>

                                    {if $isRegularPriceVisible}
                                        <p class="price__regular">
                                            {translate key="Regular price"}:
                                            <p class="price__inactive">{currency value=$rec->object->defaultStock->getPrice()}</p>
                                        </p>
                                    {/if}

                                    {if $showLowestPriceHistory && $isLowestPriceVisible}
                                        <div class="f-row clear price__omnibus">
                                            {translate key='Lowest price'}:
                                            <strong class="price__inactive">
                                                {currency value=$rec->object->stock->getHistoricalLowestPrice()}
                                            </strong>
                                        </div>
                                    {/if}

                                    {if $rec->object->currency and $currency->getIdentifier() != $rec->object->currency->getIdentifier()}
                                        <p class="product__currency">
                                            {translate key="Price"} ({$rec->object->currency->currency->name|escape}):
                                            <em class="default-currency">({currency id=$rec->object->product->currency_id rate=1 value=$rec->object->defaultStock->getCurrencySpecialOfferPrice()})</em>
                                        </p>
                                    {/if}
                                {else}
                                    <p>
                                        <em>{currency value=$rec->object->defaultStock->getPrice()}</em>
                                    </p>

                                    {if $rec->object->currency and $currency->getIdentifier() != $rec->object->currency->getIdentifier()}
                                        <p class="product__currency">
                                            {translate key="Price"} ({$rec->object->currency->currency->name|escape}):
                                            <em class="default-currency">({currency id=$rec->object->product->currency_id rate=1 value=$rec->object->defaultStock->getCurrencyPrice()})</em>
                                        </p>
                                    {/if}
                                {/if}
                            {/if}

                            {if $price_mode != '3'}
                                {if $price_mode != '2'}
                                    <span class="hide price-netto">
                                {/if}
                                    {if $rec->object->specialOffer}
                                        <p>
                                            <em class="color">{currency value=$rec->object->defaultStock->getSpecialOfferPrice(true)}</em>
                                        </p>

                                        {if $isRegularPriceVisible}
                                            <p class="price__regular">
                                                {translate key="Regular price"}:
                                                <del class="price__inactive">{currency value=$rec->object->defaultStock->getPrice(true)}</del>
                                            </p>
                                        {/if}

                                        {if $showLowestPriceHistory && $isLowestPriceVisible}
                                            <div class="f-row clear price__omnibus">
                                                {translate key='Lowest price'}:
                                                <strong class="price__inactive">
                                                    {currency value=$rec->object->stock->getHistoricalLowestPrice(true)}
                                                </strong>
                                            </div>
                                        {/if}

                                        {if $rec->object->currency and $currency->getIdentifier() != $rec->object->currency->getIdentifier()}
                                            <p class="product__currency price__currency">
                                                {translate key="Price"} ({$rec->object->currency->currency->name|escape}):
                                                <em class="default-currency">({currency id=$rec->object->product->currency_id rate=1 value=$rec->object->defaultStock->getCurrencySpecialOfferPrice(true)})</em>
                                            </p>
                                        {/if}
                                    {else}
                                        <p>
                                            <em>{currency value=$rec->object->defaultStock->getPrice(true)}</em>
                                        </p>

                                        {if $rec->object->currency and $currency->getIdentifier() != $rec->object->currency->getIdentifier()}
                                            <p class="product__currency price__currency">
                                                {translate key="Price"} ({$rec->object->currency->currency->name|escape}):
                                                <em class="default-currency">({currency id=$rec->object->product->currency_id rate=1 value=$rec->object->defaultStock->getCurrencyPrice(true)})</em>
                                            </p>
                                        {/if}
                                    {/if}
                                {if $price_mode != '2'}
                                    </span>
                                {/if}
                            {/if}
                        {/if}
                        </div>

                        {if ($enable_availability_notifier && $rec->object->isEnabledNotifier()) || $enablebasket && $rec->object->canBuyStock()}
                            {if true == $rec->object->defaultStockOnly()}
                                <form class="basket basket-box {if $loyalty_exchange}loyaltyexchange{/if}" action="{recommendationsBasketDefaultRoute value=$rec}" method="post">
                            {else}
                                <form class="basket basket-box {if $loyalty_exchange}loyaltyexchange{/if}" action="{recommendationsBasketStockRoute value=$rec}" method="get">
                            {/if}

                                {if $enablebasket && $rec->object->canBuyStock()}
                                    <fieldset>
                                        {if true == $rec->object->defaultStockOnly()}
                                        <div class="shaded_inputwrap"><input name="quantity" value="{float precision=$QUANTITY_PRECISION value=1 trim=true}" type="text" class="short center"></div>
                                        <span class="unit">{$rec->object->unit->translation->name|escape}</span>
                                        <input type="hidden" value="{$rec->object->defaultStock->getIdentifier()|escape}" name="stock_id">
                                        {/if}

                                        {if !$rec->object->isBundle()}
                                            <button class="addtobasket btn btn-red" type="submit" aria-label="{if $loyalty_exchange}{translate key="Exchange"}{else}{translate key="Add to cart"}{/if} {$rec->object->translation->name|escape}">
                                                <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1" />
                                                <span>{if $loyalty_exchange}{translate key="Exchange"}{else}{translate key="Add to cart"}{/if}</span>
                                            </button>
                                        {else}
                                            <a class="btn btn-red" href="{recommendationsViewRoute value=$rec}" rel="nofollow">{translate key="check more"}</a>
                                        {/if}
                                    </fieldset>
                                {elseif $enable_availability_notifier && $rec->object->isEnabledNotifier()}
                                    {dynamic}
                                        {assign var="availabilityNotifyUser" value=$rec->object->defaultStock->getAvailabilityNotifyByUser()}
                                        <fieldset class="availability-notifier-container{if $availabilityNotifyUser != null} none{/if}">
                                            <button class="availability-notifier-btn btn btn-red" type="submit" data-is-logged="{if true == $user_logged}true{else}false{/if}" data-stock-id="{$rec->object->defaultStock->getIdentifier()}" data-product-id="{$rec->object->product->product_id}" data-product-name="{$rec->object->translation->name|escape}">
                                                <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1" />
                                                <span>{translate key="Notify of product availability"}</span>
                                            </button>
                                        </fieldset>
                                        {if true == $user_logged}
                                            <fieldset class="availability-notifier-unsubscribe-container{if $availabilityNotifyUser == null} none{/if}">
                                                <button type="submit" class="availability-notifier-unsubscribe-btn btn btn-red" data-stock-id="{$rec->object->defaultStock->stock->stock_id}">
                                                    <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                                                    <span>{translate key="Cancel notify"}</span>
                                                </button>
                                            </fieldset>
                                        {/if}
                                    {/dynamic}
                                {/if}
                            </form>
                        {/if}
                    </div>
                {/foreach}
        </div>
    </div>
{/if}
