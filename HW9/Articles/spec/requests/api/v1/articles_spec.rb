require 'swagger_helper'

RSpec.describe 'api/v1/articles', type: :request do

  path '/api/v1/articles/{article_id}/unpublished' do
    # You'll want to customize the parameter types...
    parameter name: 'article_id', in: :path, type: :string, description: 'show unpublished articles by article_id'

    get('unpublished article') do
      tags 'Articles'
      response(200, 'successful') do
        let(:article_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/articles/{article_id}/published' do
    # You'll want to customize the parameter types...
    parameter name: 'article_id', in: :path, type: :string, description: 'show published articles by article_id'

    get('published article') do
      tags 'Articles'
      response(200, 'successful') do
        let(:article_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/articles/{article_id}/change_status' do
    # You'll want to customize the parameter types...
    parameter name: 'article_id', in: :path, type: :string,
              description: ' change status article to published/unpublished by article_id'

    patch('change_status article') do
      tags 'Articles'
      response(200, 'successful') do
        let(:article_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/articles' do
    parameter name: :search, in: :query, type: :string,
              description: 'search by text in title or body articles'
    parameter name: :status, in: :query, type: :string,
              description: 'sort article by status published/unpublished'
    parameter name: :name, in: :query, type: :string,
              description: 'search article by author name'
    parameter name: :tags, in: :query, type: :string,
              description: 'search articles by tags'
    parameter name: :order, in: :query, type: :string,
              description: 'sort articles by creation date like asc/desc'

    get('list articles') do
      tags 'Articles'
      consumes 'application/json'
      parameter name: :article, in: :path,
                description: 'if parameter not selected render all articles'
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response '404', 'article not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end

    post('create article') do
      tags 'Articles'
      consumes 'application/json'
      request_body_example value: { title: 'Foo', body: 'basic', status: 1, author_id: 4 }
      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string },
          status: { type: :integer },
          author_id: { type: :integer }
        },
        required: %w[title body status author_id]
      }

      response '201', 'article created' do
        let(:article) { { title: 'foo', body: 'bar', status: 'published', author_id: 5 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:article) { { title: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/articles/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'show article by id'

    get('show article') do
      tags 'Articles'
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response '404', 'article not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    patch('update article') do
      tags 'Articles'
      consumes 'application/json'
      request_body_example value: { title: 'Foo', body: 'basic', status: 1, author_id: 4 }
      parameter name: 'id', in: :path, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string },
          status: { type: :integer },
          author_id: { type: :integer }
        }, description: 'Update article by id',
        required: %w[title body status author_id]
      }

      response '201', 'article updated' do
        let(:article) { { title: 'foo', body: 'bar', status: 'published', author_id: 5 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:article) { { title: 'foo' } }
        run_test!
      end
    end

    put('update article') do
      tags 'Articles'
      consumes 'application/json'
      request_body_example value: { title: 'Foo', body: 'basic', status: 1, author_id: 4 }
      parameter name: :id, in: :path, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string },
          status: { type: :integer },
          author_id: { type: :integer }
        }, description: 'Update article by id',
        required: %w[title body status author_id]
      }

      response '201', 'article updated' do
        let(:article) { { title: 'foo', body: 'bar', status: 'published', author_id: 5 } }
        run_test!
      end

      response '404', 'article not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    delete('delete article') do
      tags 'Articles'
      consumes 'application/json'
      parameter name: :id, in: :path, description: 'Delete article by id'
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response '404', 'article not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
