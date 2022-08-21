import AuthorLayout from '@/layouts/AuthorLayout'
import { getBlogAuthorProfile } from '@/lib/queries'

const DEFAULT_LAYOUT = 'AuthorLayout'

export async function getStaticProps() {
  const authorDetails = await getBlogAuthorProfile()
  return { props: authorDetails, revalidate: 7200 }
}

export default function About( authorDetails ) {

  return (
    <AuthorLayout authorDetails={authorDetails} />

  )
}
