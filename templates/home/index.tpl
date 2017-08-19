{extends file="{$parentTemplateDir}index.tpl"}

{block name="head_page_title"}getWether by Magnus{/block}

{block name="body_content_main"}
    <form clas="form form-inline" action="{$self}">
        <div class="form-group">
            <label for="city">Stadt:</label>
            <input type="text" name="city" class="form-control" placeholder="Wenn kein Value angegeben wird, wird Berlin als Default gneommen." id="city">
        </div>
        <div class="form-group">
            <div id="timer">
            </div>

        </div>
        <div class="form-group">
            <div id="error">
                <p class="alert alert-danger" style="display:none;">
                    Es konnten keine Daten abgerufen werden, bitte die Verbindung überprüfen
                </p>
            </div>

            <table class="table-responsive table-hover table-bordered table">
                <thead>
                    <tr>
                        <th>Aktuelle Temperatur</th>
                        <th>Wetterdarstellung</th>
                        <th>Zeitpunkt der Messung</th>
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>
            </table>
        </div>
    </form>
{/block}