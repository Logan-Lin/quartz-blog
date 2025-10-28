import { QuartzComponent, QuartzComponentConstructor, QuartzComponentProps } from "./types"
import { classNames } from "../util/lang"

const ArticleTitle: QuartzComponent = ({ fileData, displayClass }: QuartzComponentProps) => {
  const title = fileData.frontmatter?.title
  const inProgress = fileData.frontmatter?.inProgress
  if (title) {
    return (
      <h1 class={classNames(displayClass, "article-title")}>
        {title}
        {inProgress && <span class="wip-badge">Work in Progress</span>}
      </h1>
    )
  } else {
    return null
  }
}

ArticleTitle.css = `
.article-title {
  margin: 2rem 0 0 0;
  display: flex;
  align-items: center;
  gap: 0.75rem;
  flex-wrap: wrap;
}

.wip-badge {
  font-size: 0.8rem;
  font-weight: 600;
  padding: 0.25rem 0.5rem;
  border-radius: 8px;
  background-color: #ffa726;
  color: #000;
  white-space: nowrap;
  box-shadow: 0 2px 4px rgba(255, 167, 38, 0.2);
}
`

export default (() => ArticleTitle) satisfies QuartzComponentConstructor
