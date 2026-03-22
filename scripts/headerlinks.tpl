<div class="menu row{if !count($headerlinks)} small{/if}">
        <nav class="innermenu row container relative" aria-label="{translate key='Menu'}">
            {if count($headerlinks)}
                <ul class="menu-list large standard" role="menubar">
                    <li class="home-link-menu-li">
                        <h3>
                            <a href="{baseDir nonempty=1}" title="{translate key='Home page'}">
                                <img src="{baseDir}/libraries/images/1px.gif" alt="{translate key='Home page'}" class="px1">
                            </a>
                        </h3>
                    </li>

                    {foreach from=$headerlinks item=link}
                        {if $link->getHref() || $link->isActiveCategory() || $link->isActiveNewsCategory()}
                            <li
                                {if $link->hasSubCategories() || $link->hasNewsSubCategories()}
                                    class="parent"
                                {/if}
                                {if $link->isCategory()}
                                    id="hcategory_{$link->getCategoryId()|escape}"
                                {elseif $link->isNewsCategory()}
                                    id="ncategory_{$link->getNewsCategoryId()|escape}"
                                {/if}
                                role="none"
                            >
                                <h3 role="none">
                                    <a
                                        {if $link->isPopup()}
                                            target="_blank"
                                            rel="noopener"
                                        {/if}
                                        href="{$link->getHref($view)|escape}"
                                        title="{$link->getTitle()|escape}"
                                        id="headlink{$link->getIdentifier()}"
                                        class="spanhover mainlevel"
                                        role="menuitem"
                                        {if $link->hasSubCategories()}
                                            aria-haspopup="true"
                                            {feature name="menu_navigation_rwd"}
                                                aria-expanded="false"
                                            {/feature}
                                        {/if}
                                        aria-label="{if $link->isPopup()}{translate key="%s - opens in a new tab" s1=$link->getTitle()|escape}. {else}{$link->getTitle()|escape}. {/if}{feature name="menu_navigation_rwd"}{if $link->hasSubCategories()}{translate key="Press down arrow to expand."}{/if}{/feature} {translate key="Left and right to switch menus."}"
                                    >
                                        <span>{$link->getTitle()|escape}</span>
                                        <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                                    </a>
                                </h3>
                                {if $link->hasSubCategories()}
                                    {include file='headermenu.tpl' level=1 headermenu_categories=$link->getActiveLangChildrenList() label=$link->getTitle()|escape}
                                {elseif $link->hasNewsSubCategories()}
                                    {include file='headernews.tpl' headernews_categories=$link->getNewsActiveLangChildrenList() label=$link->getTitle()|escape}
                                {/if}
                            </li>
                        {/if}
                    {/foreach}
                </ul>
            {/if}

            {dynamic}
                <ul class="menu-mobile rwd-show-medium rwd-hide-full">
                    <li class="menu-mobile-li small-menu flex flex-4">
                        <a href="{baseDir nonempty=1}" title="{translate key='Menu'}" aria-label="{translate key='Menu'}" class="fa fa-align-justify">
                            <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1" role="presentation">
                        </a>
                    </li>
                    <li class="menu-mobile-li small-search flex flex-4" id="activ-search">
                        <a title="{translate key='Search'}" aria-label="{translate key='Search'}" class="fa fa-search">
                            <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1" role="presentation">
                        </a>
                    </li>
                    <li class="menu-mobile-li small-panel flex flex-4" id="activ-panel">
                        <a href="{route key='panel'}" title="{translate key='My account'}" aria-label="{translate key='My account'}" class="fa fa-user">
                            <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1" role="presentation">
                        </a>
                    </li>
                    <li class="menu-mobile-li small-cart flex flex-4">
                        <a href="{route key='basket'}" title="{translate key='Cart'}" aria-label="{translate key='Cart'}" class="icon icon-custom-cart" data-basket-count="0">
                            <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1" role="presentation">
                        </a>
                    </li>
                </ul>
            {/dynamic}
        </nav>
    </div>

