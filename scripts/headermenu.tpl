            <div class="submenu level{$level}">
                <ul class="level{$level}" role="menu" {if $label}aria-label="{$label}"{/if}>
                    {foreach from=$headermenu_categories item=cat}
                        <li
                            class="{if count($cat->getActiveLangChildrenList())}parent{/if}"
                            id="hcategory_{$cat->getIdentifier()|escape}"
                            role="none"
                        >
                            <h3 role="none">
                                <a
                                    href="{route function='category' key=$cat->getIdentifier() categoryName=$cat->translation->name categoryId=$cat->getIdentifier() view=$view resetparams=true}"
                                    title="{$cat->translation->name|escape}"
                                    id="headercategory{$cat->getIdentifier()}"
                                    class="spanhover"
                                    role="menuitem"
                                    aria-label="{$cat->translation->name|escape}. {translate key='Use up and down arrows to navigate.'} {if count($cat->getActiveLangChildrenList())}{translate key='Press left arrow to switch menus.'}{translate key='Press right arrow to expand.'}{else}{translate key='Left and right to switch menus.'}{/if}"
                                    {if count($cat->getActiveLangChildrenList())}
                                        aria-haspopup="true"
                                        {feature name="menu_navigation_rwd"}
                                            aria-expanded="false"
                                        {/feature}
                                    {/if}
                                >
                                    <span>{$cat->translation->name|escape}</span>
                                    <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1" />
                                </a>
                            </h3>
                            
                            {if count($cat->getActiveLangChildrenList())}
                                {assign var=uplevel value=$level+1}
                                {include file='headermenu.tpl' level=$uplevel headermenu_categories=$cat->getActiveLangChildrenList() label=$cat->translation->name|escape}
                            {/if}
                        </li>
                    {/foreach}
                </ul>
            </div>
