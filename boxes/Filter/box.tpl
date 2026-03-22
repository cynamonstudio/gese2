{if count($filter_groups)}
    <div
        class="box {if 1 == $filter_counter}foldable{/if} loading"
        id="box_filter"
        {if $boxNs->$box_id->select_display}
            data-select-display="1"
        {/if}
        data-limit="{$boxNs->$box_id->list_limit}"
        role="region"
    >
        <div class="boxhead">
            <span>
                <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">{$boxNs->$box_id->title|escape}
            </span>
        </div>

        <div class="innerbox f-row">
            {if $boxNs->$box_id->text}
                <p class="boxintro">{$boxNs->$box_id->text}</p>
            {/if}

            {foreach from=$filter_groups item=group name=list}
                {if count($group.items) || ($boxNs->$box_id->price_input && 'Search_Filter_Products_Provider_Price' == $group.provider)}
                    <div
                        data-limit="{if $group.provider == 'Search_Filter_Products_Provider_Category'}{$boxNs->$box_id->category_limit}{/if}{if $group.provider == 'Search_Filter_Products_Provider_Option'}{$boxNs->$box_id->options_limit}{/if}{if $group.provider == 'Search_Filter_Products_Provider_Producer'}{$boxNs->$box_id->producer_limit}{/if}{if $group.provider == 'Search_Filter_Products_Provider_Availability'}{$boxNs->$box_id->availability_limit}{/if}{if $group.provider == 'Search_Filter_Products_Provider_Delivery'}{$boxNs->$box_id->delivery_limit}{/if}{if $group.provider == 'Search_Filter_Products_Provider_Attribute'}{$boxNs->$box_id->attributes_limit}{/if}{if $group.provider == 'Search_Filter_Products_Provider_Collection'}{$boxNs->$box_id->collection_limit}{/if}"
                        class="group group-filter"
                        aria-label="{translate key="Filter"}"
                        id="filter{if $group.id}_{$group.id}{/if}"
                        role="group"
                    >
                        <h5
                            id="filter{if $group.id}_{$group.id}{/if}_title"
                            {if $boxNs->$box_id->select_display}
                                aria-expanded="false"
                                role="button"
                                tabindex="0"
                                aria-controls="filter{if $group.id}_{$group.id}{/if}_list"
                            {/if}
                        >
                            {$group.name|escape}
                        </h5>

                        <ul id="filter{if $group.id}_{$group.id}{/if}_list" {if !$boxNs->$box_id->select_display}aria-labelledby="filter{if $group.id}_{$group.id}{/if}_title"{/if}>
                            {foreach from=$group.items item=item}
                                {if $item.active or (isset($item.counter) and $item.counter) or !isset($item.counter)}
                                    <li class="{if $item.active}selected fa fa-times{/if} {if $item.color}color-filter{/if}">
                                        <a title="{$item.name|escape}" href="{if $item.active}{$item.link_remove|escape}{else}{if $filter_type == 1 || !$item.link_add}{$item.link_solo|escape}{else}{$item.link_add|escape}{/if}{/if}"{if $item.color} class="color-filter"{/if} {if $item.link_part}data-link-part="{$item.link_part|escape}"{/if} {$boxNs->$box_id->link_rel}
                                            {if !$boxNs->$box_id->select_display}aria-label="{$item.name|escape}, {$group.name|escape}, {if isset($item.counter)}{translate key="Number of products"} {$item.counter|escape}, {/if}{if $item.active}{translate key="selected"}{else}{translate key="unselected"}{/if}"{/if}
                                        >
                                            <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1" >
                                            {if $item.html}
                                                {$item.html}
                                            {else}
                                                {if $item.color}
                                                    <span data-color="{$item.color|escape}" style="background-color: {$item.color|escape}"></span>
                                                {else}
                                                    <span>{$item.name|escape}</span>
                                                {/if}
                                            {/if}

                                            {if isset($item.counter)}
                                                <em>({$item.counter|escape})</em>
                                            {/if}
                                        </a>
                                    </li>
                                {/if}
                            {/foreach}

                            {if $boxNs->$box_id->price_input && 'Search_Filter_Products_Provider_Price' == $group.provider}
                                <li class="priceinput">
                                    <span class="fromto">
                                        {translate key='from'}
                                    </span> 

                                    <input type="text" id="filterprice1" value="" class="short" aria-label="{translate key='Price from'}"><br>

                                    <span class="fromto">
                                        {translate key='to'}
                                    </span> 

                                    <input type="text" id="filterprice2" value=""  class="short" aria-label="{translate key='Price up to'}">

                                    <div class="bottombuttons">
                                        <button class="btn" type="button" id="filterprice">
                                            <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                                            <span>{translate key='Filter'}</span>
                                        </button>
                                    </div>
                                </li>
                            {/if}
                        </ul>
                    </div>
                {/if}
            {/foreach}
        </div>
    </div>
    <script type="text/javascript">
        try {literal}{{/literal} 
            {literal}
                window.Shop = window.Shop || {};
                window.Shop.values = window.Shop.values || {};
            {/literal}
            Shop.values.PriceFilterFrom = '{$boxNs->$box_id->pricefilter_from}'; 
            Shop.values.PriceFilterFromTo = '{$boxNs->$box_id->pricefilter_fromto}'; 
            Shop.values.PriceFilterTo = '{$boxNs->$box_id->pricefilter_to}'; 
        {literal}}{/literal} catch(e) {literal}{ }{/literal}
    </script>
{/if}
