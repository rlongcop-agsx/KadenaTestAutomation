*** Variables ***
${LOGINPAGE_URL}=                      https://kadena.test.amihan.net/
${PROCUREMENTPAGE_URL}=                https://kadena.test.amihan.net/procurement
${PROCUREMENT-PO_URL}=                 https://kadena.test.amihan.net/procurement/po-submission
${ORDERINGPAGE_URL}=                   https://kadena.test.amihan.net/ordering
${ORDERING-CREATEORDER_URL}=           https://kadena.test.amihan.net/ordering/create-order
${ORDERING-PENDING_URL}=               https://kadena.test.amihan.net/ordering?status=PENDING
${ORDERING-COMPLETED_URL}=             https://kadena.test.amihan.net/ordering?status=COMPLETED
${VENDORPAGE_URL}=                     https://kadena.test.amihan.net/vendor
${INVENTORYPAGE_URL}=                  https://kadena.test.amihan.net/inventory
${QUALITYPAGE_URL}=                    https://kadena.test.amihan.net/quality
${ANALYTICSPAGE_URL}=                  https://kadena.test.tableau.launcher.amihan.net/#analytics_dashboard

${BROWSER_NAME}=                       Chrome

${VALID_FORECASTING_EMAIL}=            econsista@agsx.net
${VALID_SUPPLYPLAN_EMAIL}=             econsista@agsx.net
${VALID_ORDERING_EMAIL}=               test-order-receiver-3@example.com
${VALID_PROCUREMENT_EMAIL}=            test-procurement@example.com
${VALID_VENDOR_EMAIL}=                 ycremen+vendor2@agsx.net
${VALID_INVENTORY_EMAIL}=              test-inventory@example.com
${VALID_QUALITYMANAGEMENT_EMAIL}=      test-quality@example.com
${VALID_ANALYTICS_EMAIL}=              pvillados@agsx.net

${VALID_PASSWORD}=                     password

${INVALID_EMAIL}=                      invalid@email.com
${INVALID_PASSWORD}=                   invalidpassword

${INVALID_ERROR_MESSAGE}=              Invalid username or password.
${EMPTY_ERROR_MESSAGE}=                Please fill out this field