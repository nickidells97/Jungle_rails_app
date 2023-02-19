describe('Jungle_rails_app', () => {

  it.only("It adds a product to the cart", () => {
    cy.visit('http://0.0.0.0:3000')
    cy.contains('My Cart (0)');
    cy.get(':nth-child(1) > :nth-child(2) > .button_to > .btn').click({force: true});
    cy.contains('My Cart (1)')
  });
})