
import '../app/globals.css';
import type { ReactNode } from 'react';

export const metadata = {
  title: 'Caregiving App',
  description: 'A caregiving application built with Next.js and Supabase',
};

interface RootLayoutProps {
  children: ReactNode;
}

export default function RootLayout({ children }: RootLayoutProps) {
  return (
    <html lang="en">
      <body className="bg-gray-50 text-gray-900">
        {children}
      </body>
    </html>
  );
}
