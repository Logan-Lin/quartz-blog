import { PageLayout, SharedLayout } from "./quartz/cfg"
import * as Component from "./quartz/components"

// components shared across all pages
export const sharedPageComponents: SharedLayout = {
  head: Component.Head(),
  header: [],
  afterBody: [
    Component.ConditionalRender({
      component: Component.RecentNotes({
        title: "Recent Posts",
        limit: 5,
        showTags: true,
        linkToMore: false,
        filter: (f) => !f.slug?.endsWith("/index") && f.slug !== "index"
      }),
      condition: (page) => page.fileData.slug === "index"
    })
  ],
  footer: Component.Footer({
    links: {
      Homepage: "https://www.yanlincs.com",
      GitHub: "https://github.com/Logan-Lin",
      Email: "mailto:s@yanlincs.com"
    },
  }),
}

// components for pages that display a single page (e.g. a single note)
export const defaultContentPageLayout: PageLayout = {
  beforeBody: [
    Component.ConditionalRender({
      component: Component.Breadcrumbs(),
      condition: (page) => page.fileData.slug !== "index",
    }),
    Component.ArticleTitle(),
    Component.ContentMeta(),
    Component.TagList(),
  ],
  left: [
    Component.PageTitle(),
    Component.MobileOnly(Component.Spacer()),
    Component.Explorer(),
  ],
  right: [
    Component.TableOfContents(),
  ]
}

// components for pages that display lists of pages  (e.g. tags or folders)
export const defaultListPageLayout: PageLayout = {
  beforeBody: [Component.Breadcrumbs(), Component.ArticleTitle(), Component.ContentMeta()],
  left: [
    Component.PageTitle(),
    Component.MobileOnly(Component.Spacer()),
    Component.Explorer(),
  ],
  right: [
    Component.TableOfContents(),
  ],
}
