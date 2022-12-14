import { request, gql } from 'graphql-request'

const graphqlAPI = process.env.GRAPHQL_API_ENDPOINT

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
          slug
          name
        }
      }
    }
  `
  try {
    const posts = await request(graphqlAPI, query)
    return posts.posts

  } catch (error) {
    console.log(error)
    return []
  }
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
              slug
              name
            }
            updatedAt
            author{
              firstName
              lastName
              profile{
                avatar
                twitter
              }
            }
        }
      }
    `
  try {
    const post = await request(graphqlAPI, query, { slug })
    return post.post

  } catch (error) {
    console.log(error)
    return {}
  }
}



export async function getAllTags() {
  const query = gql`
      query {
        tags {
          slug
          name
        }
      }
    `

  try {
    const tags = await request(graphqlAPI, query)
    return tags.tags

  } catch (error) {
    console.log(error)
    return []
  }
}


export async function getTagBySlug(slug) {
  const query = gql`
      query ($slug : String!) {
        tag(slug: $slug) {
            slug
            name
            posts {
            slug
            title
            excerpt
            featuredImage            
            updatedAt
            tags{
              slug
              name
            }

          }
        }
      }
    `


  try {
    const tag = await request(graphqlAPI, query, { slug })
    return tag.tag

  } catch (error) {
    console.log(error)
    return {}
  }
}

export async function getBlogAuthorProfile() {
  const query = gql`
      query {
        authorProfile{
          firstName
          lastName
          profile {
            avatar
            about
            company
            occupation
            description
            github
            linkedin
            twitter
          }
        }
      }
    `

  try {
    const { authorProfile } = await request(graphqlAPI, query)
    return authorProfile

  } catch (error) {
    console.log(error)
    return {}
  }

}
