import { render } from '@testing-library/react';
import { describe, expect, it } from 'vitest';

import App from '../../../entrypoints/popup/App';

describe('App', () => {
  it('should render', () => {
    const { container } = render(<App />);
    expect(container).toMatchSnapshot();
  });
});
