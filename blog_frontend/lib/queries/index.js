import { request, gql } from 'graphql-request'

const graphqlAPI = process.env.NEXT_PUBLIC_GRAPHQL_ENDPOINT

export async function getPosts() {
  const query = gql`
    query {
      posts {
        title
        slug
        excerpt
        featuredImage
        updatedAt
        tags {
          name
        }
      }
    }
  `

  const posts = await request(graphqlAPI, query)
  return posts.posts
}

export async function getPostBySlug(slug) {
  const query = gql`
      query ($slug : String!) {
        post(slug: $slug) {
            slug
            title
            excerpt
            content
            featuredImage
            tags {
              name
            }
            updatedAt
            author{
              firstName
              lastName
            }
        }
      }
    `

  const post = await request(graphqlAPI, query, { slug })

  return post.post
}



export async function getAllTags() {
  const query = gql`
      query {
        tags {
          name
        }
      }
    `

  const tags = await request(graphqlAPI, query)

  return tags.tags
}


export async function getTagByName(name) {
  const query = gql`
      query ($name : String!) {
        tag(name: $name) {
            name
            posts {
            slug
            title
            excerpt
            featuredImage            
            updatedAt
            tags{
              name
            }

          }
        }
      }
    `

  const tag = await request(graphqlAPI, query, { name })

  return tag.tag
}