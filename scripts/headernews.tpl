            <div class="submenu level0">
                <ul class="level0" role="menu" {if $label}aria-label="{$label}"{/if}>
                    {foreach from=$headernews_categories item=cat}
                        <li id="ncategory_{$cat->getIdentifier()|escape}" role="none">
                            <h3 role="none">
                                <a
                                    href="{route function='newsCategory' key=$cat->getIdentifier() categoryId=$cat->getIdentifier() categoryName=$cat->category->name view=$view resetparams=true}"
                                    title="{$cat->category->name|escape}"
                                    id="headernews{$cat->getIdentifier()}"
                                    class="spanhover"
                                    role="menuitem"
                                >
                                    <span>{$cat->category->name|escape}</span>
                                    <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1" />
                                </a>
                            </h3>
                        </li>
                    {/foreach}
                </ul>
            </div>
