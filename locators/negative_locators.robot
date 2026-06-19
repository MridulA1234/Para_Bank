*** Variables ***
${error_message}  xpath=//p[@class="error"]
${login_username}  xpath=//input[@name="username"]
${login_password}  xpath=//input[@name="password"]
${login_button}  xpath=//input[@value="Log In"]
${transfer_funds_link}  xpath=//a[contains(@href,'transfer.htm')]
${transfer_amount_input}  xpath=//input[@id='amount']
${transfer_from_dropdown}  id=fromAccountId
${transfer_to_dropdown}  id=toAccountId
${transfer_button}  xpath=//input[@value='Transfer']
${transfer_complete_header}  xpath=//h1[text()='Transfer Complete!']
