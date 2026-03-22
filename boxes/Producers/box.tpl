                    <div class="box" id="box_producers">
                        <div class="boxhead">
                            <span><img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">{$boxNs->$box_id->title|escape}</span>
                        </div>
                        <div class="innerbox">
                            {if $boxNs->$box_id->text}<h5 class="boxintro">{$boxNs->$box_id->text}</h5>{/if}

                            <label 
                                class="singleselect"
                                for="box_producers_select"
                                id="box_producers_select_label">
                                    {translate key="Select vendor"}
                            </label>

                            <div class="producers_wrap">
                                <select 
                                    class="singleselect gotourl"
                                    id="box_producers_select"
                                    aria-labelledby="box_producers_select_label"
                                    aria-description="{translate key='After selecting the vendor, you will be redirected to a page with all of their products.'}">
                                        <option label="{translate key="choose"}" value="">{translate key="choose"}</option>
                                        {foreach from=$boxNs->$box_id->list item=producer key=producer_id}
                                            <option data-id="{$producer_id}" value="{$boxNs->$box_id->prod_links->$producer_id}">{$producer->name|escape}</option>
                                        {/foreach}
                                </select>
                            </div>
                        </div>
                    </div>
