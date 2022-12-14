import { TagSEO } from '@/components/SEO'
import siteMetadata from '@/data/siteMetadata'
import ListLayout from '@/layouts/ListLayout'
import generateRss from '@/lib/generate-rss'
// import { getAllFilesFrontMatter } from '@/lib/mdx'
import { getTagBySlug } from '@/lib/queries'
import { getAllTags } from '@/lib/queries'
import kebabCase from '@/lib/utils/kebabCase'
import fs from 'fs'
import path from 'path'

const root = process.cwd()

export async function getStaticPaths() {
  const tags = await getAllTags()

  return {
    paths: tags.map((tag) => ({

      params: {
        tag: tag.slug,
      },
    })),
    fallback: false,
  }
}

export async function getStaticProps({ params }) {
  const { _tag, posts } = await getTagBySlug(params.tag)
  console.log("POSTS", posts)
  // const filteredPosts = allPosts.filter(
  //   (post) => post.draft !== true && post.tags.map((t) => kebabCase(t)).includes(params.tag)
  // )

  // rss
  if (posts.length > 0) {
    const rss = generateRss(posts, `tags/${params.tag}/feed.xml`)
    const rssPath = path.join(root, 'public', 'tags', params.tag)
    fs.mkdirSync(rssPath, { recursive: true })
    fs.writeFileSync(path.join(rssPath, 'feed.xml'), rss)
  }


  return { props: { posts: posts, tag: params.tag }, revalidate: 60 }
}

export default function Tag({ posts, tag }) {
  // Capitalize first letter and convert space to dash
  return (
    <>
      <TagSEO
        title={`${tag} - ${siteMetadata.author}`}
        description={`${tag} tags - ${siteMetadata.author}`}
      />
      <ListLayout posts={posts} title={tag} />
    </>
  )
}
