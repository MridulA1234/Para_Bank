*** Variables ***
${transfer_funds_link}  xpath=//a[contains(@href,'transfer.htm')]
${tranfer_amount_input}  xpath=//input[@id='amount']
${transfer_from_dropdown}  id=fromAccountId
${transfer_to_dropdown}  id=toAccountId
${transfer_button}  xpath=//input[@value='Transfer']