describe('Jungle_rails_app', () => {

  it("There is 2 products on the page", () => {
    cy.visit('http://0.0.0.0:3000/')
    cy.get(".products article").should("have.length", 2);
  });

  it("There is products on the page", () => {
    cy.visit('http://0.0.0.0:3000/')
    cy.get(".products article").should("be.visible");
  });

  it('Render The Jungle title', () => {
    cy.visit('http://0.0.0.0:3000/')
    cy.get('.title').should("be.visible");
  })

  
})