import fs from 'fs'
import PageTitle from '@/components/PageTitle'
import Tag from '@/components/Tag'
import generateRss from '@/lib/generate-rss'
// import { MDXLayoutRenderer } from '@/components/MDXComponents'
// import { formatSlug, getAllFilesFrontMatter, getFileBySlug, getFiles } from '@/lib/mdx'
import { getPostBySlug, getPosts } from '@/lib/queries'

const DEFAULT_LAYOUT = 'PostLayout'

export async function getStaticPaths() {
  const posts = await getPosts()
  console.log("POSTS:", posts)
  return {
    paths: posts.map((p) => ({
      params: {
        slug: p.slug,
      },
    })),
    fallback: false,
  }
}

export async function getStaticProps({ params }) {
  const allPosts = await getPosts()
  const postIndex = allPosts.findIndex((post) => post.slug === params.slug)
  const prev = allPosts[postIndex + 1] || null
  const next = allPosts[postIndex - 1] || null
  const post = await getPostBySlug(params.slug)
  // const authorList = post.frontMatter.authors || ['default']
  // const authorPromise = authorList.map(async (author) => {
  //   const authorResults = await getFileBySlug('authors', [author])
  //   return authorResults.frontMatter
  // })
  const authorDetails = post.author

  // rss
  if (allPosts.length > 0) {
    const rss = generateRss(allPosts)
    fs.writeFileSync('./public/feed.xml', rss)
  }

  return { props: { post, authorDetails, prev, next } }
}

export default function Blog({ post, authorDetails, prev, next }) {
  // const { mdxSource, toc, frontMatter } = post

  return (
    <>
        <div>
          <h1 class="py-3 text-4xl">Post Content</h1>
          <p>Written by: {authorDetails.firstName} {authorDetails.lastName}</p>

          <div className="flex flex-wrap">
            {post.tags.map((tag) => (
              <Tag key={tag.name} text={tag.name} />
            ))}
          </div>
          
          {post.content}
        </div>

    </>
  )
}
