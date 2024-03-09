import Image from 'next/image';
import { ConnectButton } from '@/app/thirdweb';
import thirdwebIcon from '@public/thirdweb.svg';

export default function Home() {
	return (
		<main className='p-4 pb-10 min-h-[100vh] flex items-center justify-center container max-w-screen-lg mx-auto'>
			<div className='py-20'>
				<Header />

				<div className='flex justify-center mb-20'>
					<ConnectButton />
				</div>

				
			</div>
		</main>
	);
}

function Header() {
	return (
		<header className='flex flex-col items-center mb-20 md:mb-20'>
			<Image
				src={thirdwebIcon}
				alt=''
				className='size-[150px] md:size-[150px]'
				style={{
					filter: 'drop-shadow(0px 0px 24px #a726a9a8)',
				}}
			/>

			<h1 className='text-2xl md:text-6xl font-semibold md:font-bold tracking-tighter mb-6 text-zinc-100'>
				example test
			</h1>

			
		</header>
	);
}

function ThirdwebResources() {
	return (
		<div className='grid gap-4 lg:grid-cols-3 justify-center'>
			<ArticleCard
				title='thirdweb unified SDK Docs'
				href='https://portal.thirdweb.com/typescript/v5'
				description='thirdweb TypeScript Unified SDK documentation'
			/>

			<ArticleCard
				title='Components and Hooks'
				href='https://portal.thirdweb.com/typescript/v5/react'
				description='Learn about the thirdweb React components and hooks in thirdweb unified SDK'
			/>

			<ArticleCard
				title='thirdweb Dashboard'
				href='https://thirdweb.com/dashboard'
				description='Deploy, configure, and manage your smart contracts from the dashboard.'
			/>
		</div>
	);
}

function ArticleCard(props: { title: string; href: string; description: string }) {
	return (
		<a
			href={props.href + '?utm_source=next-template'}
			target='_blank'
			className='flex flex-col border border-zinc-800 p-4 rounded-lg hover:bg-zinc-900 transition-colors hover:border-zinc-700'
		>
			<article>
				<h2 className='text-lg font-semibold mb-2'>{props.title}</h2>
				<p className='text-sm text-zinc-400'>{props.description}</p>
			</article>
		</a>
	);
}
