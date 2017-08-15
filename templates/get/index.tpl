{extends file="{$parentTemplateDir}index.tpl"}

{block name="head_page_title"}Get&uuml;bersicht{/block}

{block name="body_content_main"}
    <div class="row">
        <div class="col-xs-12">
            {if isset($getPluginFromShop)}
                <div class="pluginItem">
                    {if is_null($getPluginFromShop.0.0)}
                        <p class="alert alert-danger">
                            <strong>Fehler: </strong>{$getPluginFromShop.0.1} ist nicht erreichbar
                        </p>
                    {else if !$getPluginFromShop.0.0}
                        <p class="alert alert-warning">
                            <strong>Warnung: </strong>{$getPluginFromShop.0.1} ist erreichbar, aber das Plugin oder das Monitoringplugin ist nicht verf&uuml;gbar.
                        </p>
                    {else if $getPluginFromShop.0.0->status === 0}
                        <p class="alert alert-warning">
                            <strong>Warnung: </strong>{$getPluginFromShop.0.1} ist erreichbar, aber das Plugin oder das Monitoringplugin ist nicht verf&uuml;gbar.
                        </p>
                    {else}
                        <div class="alert alert-success">
                            <strong>Erfolg: </strong>{$getPluginFromShop.0.1} liefert folgende Informationen zur&uuml;ck<br />
                            <ul>
                                <li><strong>Version: </strong>{$getPluginFromShop.0.0->nVersion}</li>
                                <li><strong>Installiert: </strong>{$getPluginFromShop.0.0->dInstalliert}</li>
                                <li><strong>zuletzt Aktualisiert: </strong>{$getPluginFromShop.0.0->dZuletztAktualisiert}</li>
                                <li>
                                    <strong>Status: </strong>
                                    {if $getPluginFromShop.0.0->nStatus === "2"}
                                        aktiv
                                    {else if $getPluginFromShop.0.0->nStatus === "1"}
                                        deaktiviert
                                    {else if $getPluginFromShop.0.0->nStatus === "3"}
                                        Plugin wirft einen Fehler, bitte prüfen
                                    {else if $getPluginFromShop.0.0->nStatus === "4"}
                                        Update des Plugins ist fehlgeschlagen
                                    {else if $getPluginFromShop.0.0->nStatus === "5"}
                                        dem Plugin fehlt eine gültige Lizenz
                                    {/if}
                                </li>
                            </ul>
                        </div>
                    {/if}
                </div>
            {elseif isset($getHeaderFromShop)}
                <div class="col-xs-12 shopItem">
                    <div class="row">

                        <div class="col-xs-12">
                            {if $getHeaderFromShop.0.1}
                                <div class="alert alert-danger">
                                    <strong>Warnung: </strong>Shop ist nicht erreichbar
                                </div>
                            {else}
                                <div class="alert alert-success">
                                    {if !is_null($getHeaderFromShop.0.location)}
                                        <strong>Erfolgreich: </strong>URL {$cURL} wurde auf die URL {$getHeaderFromShop.0.location} erfolgreich weitergeleitet
                                    {else}
                                        <strong>Erfolgreich: </strong>Shop ist erreichbar
                                    {/if}
                                </div>
                            {/if}
                        </div>
                    </div>
                </div>
            {else}
                <p class="alert alert-danger">
                    <strong>Warnung: </strong>Diese Seite steht Ihnen nicht zur Verf&uuml;gung
                </p>
            {/if}
        </div>
    </div>
{/block}