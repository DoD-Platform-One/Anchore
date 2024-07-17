describe('Anchore Login', () => {
  it('Admin should be able to login', () => {
    // Visit login page
    cy.visit(Cypress.env('url'))
    // login as admin
    cy.get('input[name="username"]').type(Cypress.env('user'))
    cy.get('input[name="password"]').type(Cypress.env('password'))
    cy.get('button[id="anchore-login-form-submit"]').click()
    cy.wait(3000); // wait for the dashboard to load
    cy.get('body').then($body => {
      if ($body.find('h2:contains("Welcome to Anchore Enterprise")').length > 0) {
        cy.get('button[data-action="close"]').click()
      } else {
        // Check if the dashboard is loaded
        cy.contains('Welcome to your Dashboard!')
      }
    })
  })
})


/*
// Commented out due to changes in https://docs.anchore.com/current/docs/releasenotes/560/ that removed data-test tags on UI elements
describe('Analyze Image', () => {
  it('Admin should be able to analyze an image', () => {
    // Navigate to images
    cy.contains('Images').click()
    // Add image to analyze
    cy.get('#analyze_Tag').click()
    cy.get('[data-test="analyze-tag-input-registry"] > input').type(Cypress.env('registry'))
    cy.get('[data-test="analyze-tag-input-repository"] > input').type(Cypress.env('repository'))
    cy.get('[data-test="analyze-tag-input-tag"] > input').type(Cypress.env('tag'))
    cy.get('[data-test="analyze-button-ok"]').click()
    // confirm image is getting analyzed
    cy.get('div:contains("Analyzing")', { timeout: 150000 }).should('be.visible')
    // Check if the image is analyzed and delete image
    cy.get('button[class="ui red mini basic compact icon button"]').click()
  })
})
*/
