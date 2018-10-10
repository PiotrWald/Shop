# README

# Development plan
  + integrate devise / bootstrap / overcommit / rubocop into project
  + initialize products with seeds
  + make products index view
  + build navbar basic funcionality
  + build products#show functionality
  + create invoice and invoice_prodcut model
  + add ability to add items to invoice
  + fix some issues, like diable / enable buttons for adding at appropriate time
  + work on the frontend: fix navbar so its useable
  - push to AWS if possible
  - add administrator privilage
  - add possibility to click an entire row

# Project: Add ElasticSearch to the project
  - Create suitable conditions for Elastic Search to be Usefull
    + Generate Comments
      + build Comment model
      + add Comment factory
      + add models tests
      + Comments belongs to User and Product
      + Seeed large amont of comments
      + add comments to products#show
    + Add Tags
      + Add Tag model
      + Tag belongs to product
      + Add tag spec and configure factory
      + add tag seeds
      + Render tag in some cool way .. maybe?
    - Polish some things in the application
      + add form for comments when user is logged in
      + add action to destroy invoice_product
      + add buttons in invoice#show to each prooduct
      + add close invoice action
      + add button to close invoic
      + add page invoices#index
      + prietyfy invoices
      + add possibility to post comment
      - adjust order history to current user only
  - Watch tutorial on ElasticSearch
  - Setup Elastic Search
    - install it and try to run as a service
    - Add comunication between Rails and ES
    - ......