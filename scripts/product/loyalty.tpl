    <div class="box" id="box_loyalty">
        <div class="boxhead">
            <h3>
                <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1" >
                {translate key="Exchangeable products in the loyalty program"}
            </h3>
        </div>

        <div class="innerbox">
            <div class="mb-2">
                <span class="mb-2 r--fs-xl">{translate key="Your points: %s" p1=$user_points}</span>

                {if count($awarding_msgs) > 0}
                    <div class="tooltip">
                        <span class="r--fs color_highlight tooltip-pointer">{translate key="How to gain more points"}</span>

                        <div class="tooltip-container">
                            <ul>
                                {foreach from=$awarding_msgs item=msg}
                                    <li>
                                        <strong>{$msg.title|escape}</strong><br>
                                        {$msg.text|escape}
                                    </li>
                                {/foreach}
                            </ul>
                        </div>
                    </div>
                {/if}
            </div>

            {if count($exchanging_msgs) > 0}
                <ul class="mb-1">
                    {foreach from=$exchanging_msgs item=msg}
                        <li>
                            {$msg|escape}
                        </li>
                    {/foreach}
                </ul>
            {/if}

            <form class="loyalty_filter row mb-0" method="post" action="{route key='search'}">
                <fieldset>
                    <b>{translate key='View'}:</b>
                    <input type="radio" class="gotourl" name="loylaty_filter" value="{route key='loyaltyList' filter=0}" id="loylaty_filter0"{if 0 == (int) $loyalty_filter} checked="checked"{/if} />
                    <label for="loylaty_filter0">{translate key='all products'}</label>
                    <input type="radio" class="gotourl" name="loylaty_filter" value="{route key='loyaltyList' filter=1}" id="loylaty_filter1"{if 1 == (int) $loyalty_filter} checked="checked"{/if} />
                    <label for="loylaty_filter1">{translate key='available for me'}</label>
                </fieldset>
            </form>
        </div>
    </div>
