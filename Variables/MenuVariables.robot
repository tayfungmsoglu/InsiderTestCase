*** Variables ***
${moreMenu}    xpath://span[contains(text(),'More')]
${careers}     xpath://*[@id="navbarNavDropdown"]/ul[1]/li[6]/div/div[1]/div[3]/div/a/h5
${seeAllTeams}      xpath://a[text()='See all teams']
${qualityAssurance}   xpath://img[@src="https://useinsider.com/assets/media/2021/03/qa.png"]
${seeAllQAJobs}    xpath://a[text()='See all QA jobs']
${locationFilter}    xpath://span[@title="All"]
${departmentFilter}    id:select2-filter-by-department-container
${locationIstanbul}     xpath://ul[@role="listbox"]//li[text()='Istanbul, Turkey']
${QADepartment}     xpath://ul[@role="listbox"]//li[text()='Quality Assurance']
${qaPositionNameOne}     xpath://*[@id="jobs-list"]/div[1]/div/span[text()='Quality Assurance']
${qaPositionNameTwo}     xpath://*[@id="jobs-list"]/div[2]/div/span[text()='Quality Assurance']
${qaPositionNameThree}     xpath://*[@id="jobs-list"]/div[3]/div/span[text()='Quality Assurance']
${applyNow}     xpath://div[@id='jobs-list']//div[2]//div[1]//a[1]
${DirectionButton}          xpath://*[@id="pagination"]/div/div/div[2]/ul/div/button[2]/i
${applyForThisJob}      xpath:/html/body/div[3]/div/div[1]/div/div[2]/a