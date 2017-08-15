<!DOCTYPE html>
<html lang="de">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>{block name="head_page_title"}S360 Monitoring Startseite{/block}</title>
        {block name="head_page_stylesheets"}
            <!-- bootstrap -->
            <!-- Latest compiled and minified CSS -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
            <!-- Optional theme -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous" />

            <!-- Font Awesome -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

            <!-- eigenes Theme -->
            <link rel="stylesheet" type="text/css" href="/styles/css/styles.css" />

        {/block}
        {block name="head_page_javascript"}
            <!-- jquery -->
            <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
            <!-- Latest compiled and minified JavaScript -->
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
            <!-- eigenes JavaScript -->
            <script type="text/javascript" src="/js/global.js"charset="utf-8" ></script>
        {/block}
    </head>
    <body>
        <header>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">

                    </div>
                    <div class="col-xs-12">
                        
                    </div>
                </div>
            </div>
        </header>
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    {block name="body_content_main"}

                    {/block}
                </div>
            </div>
        </div>
        <footer>
            {block name="body_footer"}
                <div class="container">
                    <div class="row">
                        <div class="col-xs-6">
                            
                        </div>
                        <div class="col-xs-6 text-right">
                            
                        </div>
                        <div class="col-xs-12">
                            <p class="text-center text-primary">DB-Version: {$DatabaseVersion}</p>
                        </div>
                    </div>
                </div>
                {if isset($debug) && isset($smarty.session.user)}
                    <script type="text/javascript">
                    var debug = {$debug}
                    console.log(debug);
                    </script>
                {/if}
                <div class="loader">
                    <div class="container">
                        <div class="content text-center">
                            <i class='fa fa-cog fa-spin fa-3x fa-fw'></i> <span class='sr-only'>Loading...</span>
                        </div>
                    </div>
                </div>
            {/block}
        </footer>
    </body>
</html>