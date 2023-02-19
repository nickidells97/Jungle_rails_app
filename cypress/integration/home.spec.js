describe('Jungle_rails_app', () => {

  beforeEach(() => {
    cy.visit('http://0.0.0.0:3000/')
  })

  it("There is 12 products on the page", () => {
    cy.get(".products article").should("have.length", 12);
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it('Render The Jungle title', () => {
     cy.get('.title').should("be.visible");
  })
})