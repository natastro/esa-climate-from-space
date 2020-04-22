import React, {FunctionComponent} from 'react';
import {useIntl} from 'react-intl';

import StoryList from '../story-list/story-list';
import Header from '../header/header';
import Share from '../share/share';

import {StoryMode} from '../../types/story-mode';

import styles from './stories-selector.styl';

const StoriesSelector: FunctionComponent = () => {
  const intl = useIntl();

  return (
    <div className={styles.storiesSelector}>
      <Header
        backLink="/"
        backButtonId="backToDataMode"
        title={intl.formatMessage({id: 'storyMode'})}>
        <Share />
      </Header>
      <StoryList mode={StoryMode.Stories} />
    </div>
  );
};

export default StoriesSelector;
