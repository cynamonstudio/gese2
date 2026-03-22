{if $boxNs->$box_id->pageid > 0}
    <div class="box {$boxNs->$box_id->format|escape}" id="box_facebooklike">
        <div 
            class="fb-page" 
            data-href="https://www.facebook.com/{$boxNs->$box_id->pageid|escape}/" 
            data-tabs="{if 1 == (int) $boxNs->$box_id->stream}timeline,messages{/if}" 
            data-width="" 
            data-height="600" 
            data-small-header="false" 
            data-adapt-container-width="true" 
            data-hide-cover="false" 
            data-show-facepile="true">
        </div>
    </div>
{/if}
