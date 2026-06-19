*** Variables ***
${register_link}  xpath=//a[contains(@href,'register.htm')]
${first_name}  id=customer.firstName
${last_name}  id=customer.lastName
${address}  id=customer.address.street
${city}  id=customer.address.city
${state}  id=customer.address.state
${zipcode}  id=customer.address.zipCode
${phone}  id=customer.phoneNumber
${ssn}  id=customer.ssn
${username}  id=customer.username
${password}  id=customer.password
${confirm_password}  id=repeatedPassword
${register_button}  xpath=//input[@value="Register"]
