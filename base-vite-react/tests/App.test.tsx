import { render } from '@testing-library/react';
import { describe, expect, it } from 'vitest';

import App from '../src/App';

describe('App', () => {
  it('should render', () => {
    const { container } = render(<App />);
    expect(container).toMatchSnapshot();
  });
});
