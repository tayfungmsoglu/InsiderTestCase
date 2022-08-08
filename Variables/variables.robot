*** Variables ***
${ınsıderUrl}   https://useinsider.com/
${loginBoxTitle}   xpath://img[@src="https://useinsider.com/assets/img/logo-old.png"]
@{chrome_arguments}    --disable-infobars        --disable-gpu
@{chrome_arguments}    --disable-infobars  --headless       --disable-gpu
${loadingBlock}  xpath://div[@class="loading" and contains(@style,'display: block')]
${loadingNone}  xpath://div[@class="loading" and contains(@style,'display: none')]
${cookies}      xpath://a[@id="wt-cli-accept-all-btn"]
