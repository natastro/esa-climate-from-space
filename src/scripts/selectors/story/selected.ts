import {State} from '../../reducers/index';

import {Story} from '../../types/story';

export function selectedStorySelector(
  state: State,
  storyId?: string
): Story | null {
  if (!state.stories.selected || !storyId) {
    return null;
  }

  return state.stories.selected.id === storyId ? state.stories.selected : null;
}
