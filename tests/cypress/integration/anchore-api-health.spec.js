describe('Basic Anchore API', function() {
  beforeEach(() => {
    cy.request(Cypress.env('anchore_url')).as('anchore-api');
  });
  it('Validate the header', () => {
    cy.get('@anchore-api')
      .its('headers')
      .its('content-type')
      .should('include', 'application/json');
  });
  it('Validate the status code', () => {
    cy.get('@anchore-api')
      .its('status')
      .should('equal', 200);
  });
  it('Validate API object', () => {
    cy.get('@anchore-api')
      .its('body')
      .should('include', { basePath: '/v1' });
  });
})
