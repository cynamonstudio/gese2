{foreach from=$product->files item=file}
    {if $file->type == constant('Logic_ProductFile::TYPE_REGULAR')}
        {append var="regularFiles" value=$file}
    {/if}
{/foreach}

{if strlen(trim($product->translation->description)) || (isset($regularFiles) && $regularFiles|@count > 0)}
    <div class="box tab" id="box_description" tabindex="-1">
        <div class="boxhead">
            <h3>
                <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                {translate key="Description"}
            </h3>
        </div>

        <div class="innerbox">
            <div class="resetcss fr-view" itemprop="description">{$product->translation->description}</div>
            {if isset($regularFiles) && $regularFiles|@count > 0}
                <div class="productfiles">
                    <h5 class="">{translate key="Files to download"}:</h5>
                    <ul class="productfiles">
                        {foreach from=$regularFiles item=file}
                            <li>
                                <a
                                    href="{route key='productFile' name=$file->name file=$file->file_name}"
                                    title="{if $file->description}{$file->description|escape}{else}{$file->name|escape}{/if}"
                                    class="spanhover">
                                        <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                                        <span>{if $file->description}{$file->description|escape}{else}{$file->name|escape}{/if}</span>
                                </a>
                            </li>
                        {/foreach}
                    </ul>
                </div>
            {/if}
        </div>
    </div>
{/if}