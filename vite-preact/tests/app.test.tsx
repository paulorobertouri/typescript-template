import { render } from '@testing-library/preact';
import { describe, expect, it } from 'vitest';

import { App } from '@/app';

describe('App', () => {
  it('should render', () => {
    const { container } = render(<App />);
    expect(container).toMatchSnapshot();
  });
});
