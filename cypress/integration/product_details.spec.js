/// <reference types="cypress" />

describe('Jungle_rails_app', () => {

  it("It clicks on a product link from the home page", () => {
    cy.visit('http://0.0.0.0:3000/')
    cy.contains('Giant Tea').click()
  });
})