import SocialIcon from '@/components/social-icons'
import Image from '@/components/Image'
import { PageSEO } from '@/components/SEO'

export default function AuthorLayout({ authorDetails }) {
  try {
    const { firstName, lastName, profile } = authorDetails
    const {avatar, occupation, company, description, twitter, linkedin, github} = profile
  
    return (
      <>
        <PageSEO title={`About - ${firstName} ${lastName}`} description={`About me - ${firstName} ${lastName}`} />
        <div className="divide-y divide-gray-200 dark:divide-gray-700">
          <div className="space-y-2 pt-6 pb-8 md:space-y-5">
            <h1 className="text-3xl font-extrabold leading-9 tracking-tight text-gray-900 dark:text-gray-100 sm:text-4xl sm:leading-10 md:text-6xl md:leading-14">
              About 
            </h1>
          </div>
          <div className="items-start space-y-2 xl:grid xl:grid-cols-3 xl:gap-x-8 xl:space-y-0">
            <div className="flex flex-col items-center pt-8">
              <Image
                src={avatar}
                alt="avatar"
                width={350}
                height={300}
                className="h-48 w-48 rounded-full"
              />
              <h3 className="pt-4 pb-2 text-2xl font-bold leading-8 tracking-tight">{firstName} {lastName}</h3>
              <div className="text-gray-500 dark:text-gray-400">{occupation}</div>
              <div className="text-gray-500 dark:text-gray-400">{company}</div>
              <div className="flex space-x-3 pt-6">
                <SocialIcon kind="github" href={github} />
                <SocialIcon kind="linkedin" href={linkedin} />
                <SocialIcon kind="twitter" href={twitter} />
              </div>
            </div>
            <div className="prose max-w-none pt-8 pb-8 dark:prose-dark xl:col-span-2">{description}</div>
          </div>
        </div>
      </>
    )
    
  } catch (error) {
    return (
      <div className="divide-y divide-gray-200 dark:divide-gray-700">
        <div className="space-y-2 pt-6 pb-8 md:space-y-5">
          <h4 className="text-xl font-extrabold leading-9 tracking-tight text-gray-900 dark:text-gray-100 sm:text-xl sm:leading-10 md:text-3xl md:leading-14">
            No profile information added by Author
          </h4>
        </div>
      </div>
    )
  }
}
